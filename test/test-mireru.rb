require "mireru2/command/mireru2"
require "mireru2/container"

class Mireru2Test < Test::Unit::TestCase
  def setup
    @mireru2 = Mireru2::Command::Mireru2.new
  end

  def test_run_help_option
    arguments = %w(--help)
    mock(@mireru2).write_help_message
    assert_raise SystemExit do
      @mireru2.run(arguments)
    end
  end

  def test_run_help_option_sugar
    arguments = %w(-h)
    mock(@mireru2).write_help_message
    assert_raise SystemExit do
      @mireru2.run(arguments)
    end
  end

  def test_run_version_option
    arguments = %w(--version)
    mock(@mireru2).write_version_message
    assert_raise SystemExit do
      @mireru2.run(arguments)
    end
  end

  def test_run_empty
    arguments = %w(hoge)
    stub(@mireru2).files_from_arguments { arguments }
    mock.instance_of(Mireru2::Container).empty? { true }
    mock(@mireru2).write_empty_message
    assert_raise SystemExit do
      @mireru2.run(arguments)
    end
  end

  def test_files_from_arguments_no_argument
    arguments = %w()
    expected = %w(dir1 file1 dir2)
    mock(Dir).glob("*") { expected }
    files = @mireru2.__send__(:files_from_arguments, arguments)
    assert_equal(files, expected)
  end

  def test_files_from_arguments_recursive_option_only
    arguments = %w(-R)
    expected = %w(dir1 file1 dir2 dir1/file1 dir1/file2 dir2/file1)
    mock(Dir).glob("**/*") { expected }
    files = @mireru2.__send__(:files_from_arguments, arguments)
    assert_equal(files, expected)
  end

  def test_files_from_arguments_recursive_option_and_dir
    arguments = %w(-R dir1 file1 dir2)
    expected_dir1 = %w(dir1/file1 dir1/file2)
    expected_dir2 = %w(dir2/file1)
    expected = [expected_dir1, "file1", expected_dir2].flatten
    mock(File).directory?("dir1") { true }
    mock(File).directory?("file1") { false }
    mock(File).directory?("dir2") { true }
    mock(Dir).glob("dir1/**/*") { expected_dir1 }
    mock(Dir).glob("dir2/**/*") { expected_dir2 }
    files = @mireru2.__send__(:files_from_arguments, arguments)
    assert_equal(files, expected)
  end

  def test_files_from_arguments_all_dir
    arguments = %w(dir1 dir2)
    expected_dir1 = %w(dir1/file1 dir1/file2)
    expected_dir2 = %w(dir2/file1)
    expected = [expected_dir1, expected_dir2].flatten
    mock(File).directory?("dir1") { true }
    mock(File).directory?("dir2") { true }
    mock(Dir).glob("dir1/*") { expected_dir1 }
    mock(Dir).glob("dir2/*") { expected_dir2 }
    files = @mireru2.__send__(:files_from_arguments, arguments)
    assert_equal(files, expected)
  end

  def test_files_from_arguments_else
    arguments = %w(dir1 file1 dir2)
    files = @mireru2.__send__(:files_from_arguments, arguments)
    assert_equal(files, arguments)
  end

  def test_purge_option
    arguments = %w(-R -f ubuntu dir1 file1 dir2)
    flag = @mireru2.__send__(:purge_option, arguments, /\A(-R|--recursive)\z/)
    assert_not_nil(flag)
    assert_equal(%w(-f ubuntu dir1 file1 dir2), arguments)
    value = @mireru2.__send__(:purge_option, arguments, /\A-f\z/, true)
    assert_equal("ubuntu", value)
    assert_equal(%w(dir1 file1 dir2), arguments)
  end
end
