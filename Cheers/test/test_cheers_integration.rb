require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... B
Give me a... R
Give me a... T
BRT's just GRAND!
Your name backwards is trb
EOS
    assert_equal shell_output, expected_output
  end

  def test_works_for_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("poppa")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... P
Give me an... O
Give me a... P
Give me a... P
Give me an... A
POPPA's just GRAND!
Your name backwards is appop
EOS
    assert_equal shell_output, expected_output
  end

  def test_reverse_your_name
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("pete")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "etep"
  end

#   # But what about names with vowels?!!
end

# use string =~ /sdfkjljk/
# this takes a string and returns true or false if it is match according to regex


def test_a_name_with_no_vowels
    shell_output = `ruby cheers.rb brt`
    expected_output = <<EOS
What's your name?
Give me a... B
Give me a... R
Give me a... T
BRT's just GRAND!
Your name backwards is trb
EOS
    assert_equal shell_output, expected_output
  end


