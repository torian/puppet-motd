
require 'spec_helper'

describe 'motd::register' do

	let(:title)  { 'Test' } 
	let(:name)   { :title } 
	let(:facts) { { 
		:operatingsystem => 'Debian',
		:concat_basedir  => '/var/lib/puppet/concat',
	} } 
	it { should include_class('motd::params') }

	context 'No content specified fallback to title' do
		let(:params) { { 
			:content => ''
		} }
		it {
			should contain_concat__fragment("motd::fragment::#{title}").with( {
				:target  => '/etc/motd',
				:content => "	- #{title}"
			} ) 
		}
	end
	
	context 'Content specified' do
		let(:params) { { 
			:content => 'Some content'
		} }
		it {
			should contain_concat__fragment("motd::fragment::#{title}").with( {
				:target  => '/etc/motd',
				:content => "	- #{params[:content]}"
			} ) 
		}
	end

end
