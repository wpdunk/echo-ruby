require 'echo'

describe Echo do
  it "prints prompt statement" do
    expect { Echo.prompt }.to output(
     a_string_including("Say something")
   ).to_stdout
  end

  it "saves user input after prompt" do
    allow(Echo).to receive(:gets) { "hello, world!\n" }
    expect(Echo.receive).to eq("hello, world!")
  end

  it "saves time of input" do
    @time_now = Time.new(2019, 03, 12, 10, 41, 28, "+00:00")
    allow(Time).to receive(:now) {@time_now}
    expect(Echo.time).to eq("2019-03-12 | 10:41")
  end

  it "responds in correct format to input" do
    3.times {allow(Echo).to receive(:gets) { "hello, world!\n" }}
    allow(Echo).to receive(:gets) { "exit" }
    @time_now = Time.new(2019, 03, 12, 10, 41, 28, "+00:00")
    allow(Time).to receive(:now) {@time_now}
    expect { Echo.run }.to output(
     a_string_including("2019-03-12 | 10:41 | You said: 'hello, world!'")
   ).to_stdout
   allow(Echo).to receive(:gets) { "exit" }
  end

  it "exits with 'Goodbye!' if input equals 'exit'" do
    allow(Echo).to receive(:gets) { "exit" }
    @time_now = Time.new(2019, 03, 12, 10, 41, 28, "+00:00")
    allow(Time).to receive(:now) {@time_now}
    expect { Echo.run }.to output(
     a_string_including("Goodbye!")
   ).to_stdout
  end

end
