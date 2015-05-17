Rails.application.assets.register_engine('.slim', Slim::Template)
Slim::Engine.set_default_options(
  attr_list_delims: {'(' => ')', '[' => ']'},
  code_attr_delims: {'(' => ')', '[' => ']'},
  format: :html5
)
