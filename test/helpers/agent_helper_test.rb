require 'test_helper'

class AgentHelperTest < ActionView::TestCase
  test 'link_to_agent_email should format a link_to' do
    expected_link = link_to 'James Bond', 'mailto:jamesbond007@mi6.gov.uk', class: 'mailto', target: '_blank'
    assert_equal expected_link, link_to_agent_email(agents(:bond))
  end
end
