RSpec.describe CalculateFuel do
  subject { CalculateFuel.calculate_for(mass) }
  context "calculating a single value" do
    context "when not rounding" do
      let(:mass) {12}
      it { is_expected.to eq 2}
    end

    context "when not rounding" do
      let(:mass) {14}
      it { is_expected.to eq 2}
    end
  end

  context "when adding values" do
    let(:mass) {[12, 14]}
    it { is_expected.to eq 4}
  end

  context "when compensating for fuel mass" do
    let(:mass) { 1969 }
    it { is_expected.to eq 966}
  end

  context "when compensating for fuel mass" do
    let(:mass) { 100756 }
    it { is_expected.to eq 50346}
  end

  context "when compensating for fuel and adding " do
    let(:mass) { [100756, 1969, 14,12]}
    it { is_expected.to eq (50346+966+2+2)}
  end

  context "when solving the problem" do
    let(:mass) {[
      100725,
      63593,
      84738,
      143809,
      108595,
      94419,
      91617,
      91573,
      102728,
      143383,
      74613,
      80331,
      76530,
      139884,
      104607,
      107171,
      107640,
      87284,
      120827,
      85742,
      62474,
      97582,
      110668,
      73426,
      57656,
      70819,
      89848,
      138732,
      54386,
      116905,
      107954,
      131488,
      75056,
      97660,
      55295,
      146265,
      58026,
      94712,
      73636,
      138077,
      61480,
      148868,
      119364,
      145430,
      103901,
      134202,
      106759,
      50254,
      82440,
      117801,
      80263,
      97022,
      145229,
      57702,
      57460,
      58401,
      145652,
      127341,
      123585,
      65291,
      70219,
      147009,
      88728,
      72059,
      83815,
      99635,
      80913,
      149475,
      61798,
      110054,
      102505,
      148511,
      95160,
      50208,
      129867,
      57079,
      138435,
      75865,
      63185,
      142389,
      78370,
      108077,
      106438,
      86267,
      100785,
      101165,
      68501,
      146079,
      122420,
      121429,
      62608,
      115338,
      90667,
      131391,
      50260,
      85343,
      76411,
      94432,
      130126,
      80915,
      ]}

      it { is_expected.to eq 4903193}
  end
end
