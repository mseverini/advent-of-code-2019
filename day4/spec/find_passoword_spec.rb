RSpec.describe FindPassword do
  context "when finding if a password is valid" do
    subject { FindPassword.is_valid?(password) }

    describe "finds valid" do
      let(:password) { 112233 }

      it { is_expected.to be true }
    end

    describe "finds valid with repeated" do
      let(:password) { 111122 }

      it { is_expected.to be true }
    end

    describe "finds invalid due to too many matching" do
      let(:password) { 111111 }

      it { is_expected.to be false }
    end

    describe "finds invalid due to no duplicates" do
      let(:password) { 123456 }

      it { is_expected.to be false }
    end

    describe "finds invalid due to decreasing values" do
      let(:password) { 123450 }

      it { is_expected.to be false }
    end
  end

  context 'when finding the number of valid passwords in an array' do
    subject { FindPassword.in_range(range) }

    describe "the number of passwords" do
      let(:range) { [111111, 123456, 123450] }

      it { is_expected.to eq 1 }
    end

    describe "when solving the problem" do
      let(:range) { 145852..616942 }

      it { is_expected.to eq 1 }
    end
  end
end
