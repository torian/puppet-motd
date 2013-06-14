
require 'spec_helper'

describe 'motd' do
	
	opts = {
		'Debian' => {
			:arch      => 'amd64',
		},
		'Redhat' => {
			:arch      => 'x86_64',
		},
		'CentOS' => {
			:arch      => 'x86_64',
		}
	} 
	
	opts.keys.each do |os|
		describe "Running on #{os}" do
			let(:facts) { {
				:operatingsystem => os,
				:architecture    => opts[os][:arch],
			  :concat_basedir  => '/var/lib/puppet/concat',
			} }

		it { should include_class('motd::params') }
		it { should include_class('concat::setup') }
		it {
			should contain_concat__fragment('motd::header').with(
				'target' => '/etc/motd',
				'order'  => '50',
			)
		}

    end

  end

	context 'Running on unhandled OS' do
		let(:facts) { { 
			:operatingsystem => nil,
			:concat_basedir  => '/var/lib/puppet/concat',
		} }
		
		it do 
			expect { 
				should include_class('motd::params') 
			}.to raise_error(Puppet::Error, /^Operating system.*/)
		end

	end

end
