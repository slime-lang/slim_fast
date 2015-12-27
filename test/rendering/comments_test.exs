defmodule RenderCommentsTest do
  use ExUnit.Case, async: true
  use SlimFast.Renderer

  test "lines started with / are commented out" do
    slim = """
    / code comment
    p.test
    """
    assert render(slim) == ~s(<p class="test"></p>)
  end

  test "/! renders html comments" do
    assert render(~s(/! html comment)) == ~s(<!--html comment-->)
  end

  test "/![foo] renders IE comments" do
    assert render(~s(/[if IE] html comment)) == ~s(<!--[if IE]>html comment<![endif]-->)
  end
end
