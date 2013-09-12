require "mireru2/widget"

class WidgetTest < Test::Unit::TestCase
  def test_image?
    assert_nil(Mireru2::Widget.image?(__FILE__))
    assert_not_nil(Mireru2::Widget.image?("test/fixtures/nijip.png"))
    assert_not_nil(Mireru2::Widget.image?("hoge.PNG"))
    assert_not_nil(Mireru2::Widget.image?("hoge.jpg"))
    assert_not_nil(Mireru2::Widget.image?("hoge.jpeg"))
    assert_not_nil(Mireru2::Widget.image?("hoge.gif"))
  end

  def test_buffer_from_file_of_text
    widget = Mireru2::Widget.__send__(:buffer_from_file, __FILE__)
    assert_equal(Gtk::SourceBuffer, widget.class)
  end

  def test_buffer_from_file_of_binary
    assert_raise Mireru2::Error do
      Mireru2::Widget.__send__(:buffer_from_file, "test/fixtures/nijip.png")
    end
  end

  def test_buffer_from_text_of_utf8
    widget = Mireru2::Widget.__send__(:buffer_from_text, "御庭番")
    assert_equal(Gtk::SourceBuffer, widget.class)
  end

  def test_buffer_from_text_of_sjis
    widget = Mireru2::Widget.__send__(:buffer_from_text, "御庭番".encode("SJIS"))
    assert_equal(Gtk::SourceBuffer, widget.class)
  end
end
