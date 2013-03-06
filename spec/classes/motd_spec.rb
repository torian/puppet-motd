
require 'spec_helper'

describe 'motd' do

	
	context 'On Debian' do
		let(:facts) { { 
			:operatingsystem => 'Debian',
			:concat_basedir  => '/var/lib/puppet/concat',
		} }

		it { should include_class('motd::params') }
		it { should include_class('concat::setup') }
		it {
			should contain_concat__fragment('motd::header').with(
				'target' => '/etc/motd',
				'order'  => '01',
			)
		}
	end

	context 'On Redhat' do
		let(:facts) { { 
			:operatingsystem => 'Redhat',
			:concat_basedir  => '/var/lib/puppet/concat',
		} }

		it { should include_class('motd::params') }
		it { should include_class('concat::setup') }
		it {
			should contain_concat__fragment('motd::header').with(
				'target' => '/etc/motd',
				'order'  => '01',
			)
		}
	end
	
	context 'On unhandled OS' do
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
