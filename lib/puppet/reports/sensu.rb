require 'puppet'
require 'json'

Puppet::Reports.register_report(:sensu) do
  # Puppet encloses this block within an anonymous module and
  # extends a Puppet::Transaction::Report with it at runtime.
  #
  # Read more about Puppet::Transaction::Report and friends here:
  #
  #   + https://docs.puppetlabs.com/guides/reporting.html
  #   + https://docs.puppetlabs.com/puppet/3.7/reference/format_report.html
  #

  desc <<-DESC
  Send Puppet reports to a local Sensu client.
  DESC

  def check_source
    self.host || 'unknown'
  end

  def check_name
    "puppet-report-#{check_source}"
  end

  def check_code
    (self.status == 'failed') ? 1 : 0
  end

  def check_state
    (self.status == 'failed') ? 'WARNING' : 'OK'
  end

  def check_output
    "#{check_state} - Puppet run for #{self.host} #{self.status} at #{Time.now.asctime} on #{self.configuration_version} in #{self.environment}"
  end

  def check_data
    {
      'name'    => check_name,
      'status'  => check_code,
      'source'  => check_source,
      'output'  => check_output,
    }
  end

  def submit(data = {})
    UDPSocket.new.tap do |socket|
      socket.connect('127.0.0.1', 3030)
      socket.send(data.to_json + "\n", 0)
    end
  end

  def process
    Puppet.debug "Sending report status for #{self.host} as check to local Sensu client at 127.0.0.1:3030."
    submit(check_data)
  end
end
