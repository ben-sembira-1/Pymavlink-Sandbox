from template import with_signature


def test_template():
    assert with_signature("test") == "TEMPLATE >>> test"
