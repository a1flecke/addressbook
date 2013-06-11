Tabulous.setup do

  tabs do

    # addresses_tab do
    #   text          { 'Addresses' }
    #   link_path     { family_addresses_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('addresses') }
    # end

    # phone_numbers_tab do
    #   text          { 'Phone Numbers' }
    #   link_path     { family_person_phone_numbers_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('phone_numbers') }
    # end

    # comments_tab do
    #   text          { 'Comments' }
    #   link_path     { family_comments_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('comments') }
    # end

    # emails_tab do
    #   text          { 'Emails' }
    #   link_path     { family_person_emails_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('emails') }
    # end
    families_tab do
      text          { 'Families' }
      link_path     { root_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('families') }
    end

    people_tab do
      text          { 'People' }
      link_path     { people_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('people') }
    end


    # tags_tab do
    #   text          { 'Tags' }
    #   link_path     { tags_path }
    #   visible_when  { true }
    #   enabled_when  { true }
    #   active_when   { in_action('any').of_controller('tags') }
    # end

  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, or :bootstrap_pill
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the currrent controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#FFFF'
    text_color '#FF'
    active_tab_color '#fff'
    hover_tab_color '#ddd'
    inactive_tab_color '#aaa'
    inactive_text_color '#888'
  end

end
