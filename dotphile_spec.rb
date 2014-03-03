ENV['DOTFILES_DIR'] = File.join('.', 'spec/fixtures/dotfiles')
ENV['HOME_PATH'] = File.join('.', 'temp/home/username')

describe 'dotphile' do
  describe '-c' do
    before do
      @output = `./dotphile -c`
      @status = $?
    end

    context 'output' do
      subject { @output }

      it { should == '' }

      specify { expect { subject.grep(/dotfiles_dir/).split('=').last }.to eq './spec/fixtures/dotfiles' }
      specify { expect { subject.grep(/home_path/).split('=').last }.to eq './temp/home/username' }
    end

    context 'status' do
      subject { @status.to_i }

      it { should eq 0 }
    end
  end

  describe '-a' do
    context 'when both arguments are provided' do
      context 'when both arguments are valid' do
        let(:package) { }
        let(:configuration_file_path) { }

        before do
          @output = `./dotphile -a #{package} #{configuration_file_path}`
          @status = $?
        end

        context 'output' do
          subject { @output }

        end

        context 'status' do
          subject { @status.to_i }

          it { should eq 0 }
        end
      end
    end
  end
end
