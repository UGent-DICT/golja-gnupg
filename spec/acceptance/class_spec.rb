require 'spec_helper_acceptance'

describe 'gnupg class' do
  package_name = case os[:family].downcase
                 when 'redhat'
                   'gnupg2'
                 when 'debian'
                   'gnupg'
                 else
                   'gnupg'
                 end

  context 'default parameters' do
    it 'works with no errors' do
      pp = <<-EOS
      class { 'gnupg': }
      EOS

      # Run it twice and test for idempotency
      idempotent_apply(pp)
    end

    describe package(package_name) do
      it { is_expected.to be_installed }
    end
  end
end
