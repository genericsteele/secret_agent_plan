require 'test_helper'

class AgentHelperTest < ActionView::TestCase
  test 'link_to_agent_email should format a link_to' do
    expected_link = link_to 'Sterling Archer', 'mailto:duchess@cia.gov', class: 'mailto', target: '_blank'
    assert_equal expected_link, link_to_agent_email(agents(:archer))
  end
end
