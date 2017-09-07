require 'faraday_middleware/response/parse_hal_json'

describe FaradayMiddleware::ParseHalJson, :type => :response do
  context "no type matching" do
    it "doesn't change nil body" do
      expect(process(nil).body).to be_nil
    end

    it "nullifies empty body" do
      expect(process('').body).to be_nil
    end

    it "parses json body" do
      response = process('{"a":1}')
      expect(response.body).to eq('a' => 1)
      expect(response.env[:raw_body]).to be_nil
    end
  end

  context "with preserving raw" do
    let(:options) { {:preserve_raw => true} }

    it "parses json body" do
      response = process('{"a":1}')
      expect(response.body).to eq('a' => 1)
      expect(response.env[:raw_body]).to eq('{"a":1}')
    end

    it "can opt out of preserving raw" do
      response = process('{"a":1}', nil, :preserve_raw => false)
      expect(response.env[:raw_body]).to be_nil
    end
  end

  context "with regexp type matching" do
    let(:options) { {:content_type => /\bjson$/} }

    it "parses json body of correct type" do
      response = process('{"a":1}', 'application/x-json')
      expect(response.body).to eq('a' => 1)
    end

    it "ignores json body of incorrect type" do
      response = process('{"a":1}', 'text/json-xml')
      expect(response.body).to eq('{"a":1}')
    end
  end

  context "with array type matching" do
    let(:options) { {:content_type => %w[a/b c/d]} }

    it "parses json body of correct type" do
      expect(process('{"a":1}', 'a/b').body).to be_a(Hash)
      expect(process('{"a":1}', 'c/d').body).to be_a(Hash)
    end

    it "ignores json body of incorrect type" do
      expect(process('{"a":1}', 'a/d').body).not_to be_a(Hash)
    end
  end

  it "chokes on invalid json" do
    ['{!', '"a'].each do |data|
      expect{ process(data) }.to raise_error(Faraday::ParsingError)
    end
  end

  context "HEAD responses" do
    it "nullifies the body if it's only one space" do
      response = process(' ')
      expect(response.body).to be_nil
    end

    it "nullifies the body if it's two spaces" do
      response = process(' ')
      expect(response.body).to be_nil
    end
  end
end
