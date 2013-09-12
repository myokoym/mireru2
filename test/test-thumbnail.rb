require "mireru2/thumbnail"

class ThumbnailTest < Test::Unit::TestCase
  def test_image_from_file
    widget = Mireru2::Thumbnail.__send__(:image_from_file,
                                        "test/fixtures/nijip.png")
    assert_equal(Gtk::Image, widget.class)
  end

  def test_label_from_fil
    widget = Mireru2::Thumbnail.__send__(:label_from_file,
                                        __FILE__)
    assert_equal(Gtk::Label, widget.class)
  end
end
