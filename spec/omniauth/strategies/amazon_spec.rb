require 'spec_helper'

describe OmniAuth::Strategies::Amazon do
  subject do
    @options = {
      app_id: 'myappidissecret',
      aws_key: 'opensesame',
      secret_key: 'shazam',
    }
    strategy = OmniAuth::Strategies::Amazon.new('will', @options[:app_id], @options[:aws_key], @options[:secret_key])
    strategy.stub(:session) { {  } }
    strategy
  end

  it "should have correct options" do
    expect(subject.options.app_id).to eq(@options[:app_id])
    expect(subject.options.aws_key).to eq(@options[:aws_key])
    expect(subject.options.secret_key).to eq(@options[:secret_key])
  end

  it 'should have the correct callback path' do
    expect(subject.callback_path).to eq('/auth/amazon/callback')
  end

  it "should create a valid activation URL" do
    uri = URI.parse(subject.activation_url)
    hash = Rack::Utils.parse_nested_query(uri.query)
    expect(hash).to eq({"AWSAccessKeyId"=>"opensesame",
                    "SignatureMethod"=>"HmacSHA256",
                    "SignatureVersion"=>"2",
                    "id"=>"myappidissecret",
                    "returnPathAndParameters"=>"/auth/amazon/callback",
                    "Signature"=>"nr4QcQx4S0TZsCSp4zwNm+Y51rYuthFvCXC+Sep08lA="})
  end

end
