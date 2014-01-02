require 'spec_helper'

describe OmniAuth::Strategies::AmazonMarketplace do
  subject do
    @options = {
      app_id: 'myappidissecret',
      aws_key: 'opensesame',
      secret_key: 'shazam',
    }
    strategy = OmniAuth::Strategies::AmazonMarketplace.new('will', @options[:app_id], @options[:aws_key], @options[:secret_key])
    strategy.stub(:session) { {  } }
    strategy
  end

  it "should have correct options" do
    expect(subject.options.app_id).to eq(@options[:app_id])
    expect(subject.options.aws_key).to eq(@options[:aws_key])
    expect(subject.options.secret_key).to eq(@options[:secret_key])
  end

  it 'should have the correct callback path' do
    expect(subject.callback_path).to eq('/auth/amazon_marketplace/callback')
  end

  it "should create a valid activation URL" do
    uri = URI.parse(subject.activation_url)
    hash = Rack::Utils.parse_nested_query(uri.query)
    expect(hash).to eq({"AWSAccessKeyId"=>"opensesame",
                    "SignatureMethod"=>"HmacSHA256",
                    "SignatureVersion"=>"2",
                    "id"=>"myappidissecret",
                    "returnPathAndParameters"=>"/auth/amazon_marketplace/callback",
                    "Signature"=>"HYpoYISDugk7fC0z3EbQxZ7IJARwOZdBQJHTfloft/M="})
  end

end
