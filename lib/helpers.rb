# Helpers for Vagrant files
PLATFORMS  = ['rhel6', 'rhel7', 'centos7', 'fedora20', 'gildub/fedora20']

def fatal(msg)
  puts msg
  exit 1
end

def openstack
  ENV['OPENSTACK'] ? ENV['OPENSTACK'] : 'rhos'
end

def openstack_version
  ENV['OPENSTACK_VERSION'] ? ENV['OPENSTACK_VERSION'] : '5'
end

def platform
  ENV['PLATFORM'] ? ENV['PLATFORM'] : 'rhel7'
end

def opm
  ENV['OPM'] ? ENV['OPM'] : 'rpm'
end

def opm_branch
  ENV['OPM_BRANCH'] ? ENV['OPM_BRANCH'] : 'master'
end

def quickstack
  ENV['QUICKSTACK'] ? ENV['QUICKSTACK'] : 'rpm'
end

def quickstack_branch
  ENV['QUICKSTACK_BRANCH'] ? ENV['QUICKSTACK_BRANCH'] : 'master'
end

class Hosts
  include Enumerable

  def initialize(domain)
    @domain = domain
    @hosts = {}
  end

  def each
    @hosts.each do |host|
      yield host
    end
  end

  def add(name, ip)
    @hosts.merge!({ name => ip })
  end

  def get(name)
    @hosts[name] if @hosts.key?(name)
  end

  def fqdn(name)
    "#{name}.#{@domain}" if @hosts.key?(name)
  end

  def to_s
    hosts = ""
    @hosts.each do |name, ip|
      hosts << "#{ip[0]} "
      hosts << "#{name}.#{@domain} "
      hosts << "#{name}\n"
    end
    return hosts
  end

  def name(name)
    "#{name}" if @hosts.key?(name)
  end
end
