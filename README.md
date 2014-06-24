# _What Do I Test?_

This is a practice exercise for folks who've read the Rails testing book, _["What Do I Test?"](https://whatdoitest.com)_. It helps if you've read the book, but feel free to write some tests and send me a pull request even if haven't.

## Add Some Tests

Your mission (should you chose to accept it), is to make the tests in this app pass.

### Setup

```bash
git clone git@github.com:whatdoitest/secret_agent_plan.git
cd secret_agent_plan
bundle install
```

Now, you should be able to run all those tests with `rake`:

```bash
$ rake
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF

Finished in 0.067502s, 592.5750 runs/s, 592.5750 assertions/s.

(lots of other output)

40 runs, 40 assertions, 40 failures, 0 errors, 0 skips
```

### Workflow

Have a look in the `tests/` directory. It's filled with 40 tests that are set to fail with `flunk`, like this guy right here:

```ruby
require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  test 'must have an email first_name and last_name' do
    flunk
  end
  ...
end
```

Using what you've learned from the book, take this requirement and make the test pass. 

You are going to bump into a few walls, but like a Roomba, just turn yourself around and try again with these tips:

* Fixtures are your friends. Set them up early
* Make sure you have a Model class set up
* That includes a migration to go along with it
* You can take a peak in the `answers` branch if you are unsure

### Check your tests with pull requests

Remember that because it rhymes.  
Also, because that's the best way for me to give you feedback and answer questions. Follow github's [pull request guide](https://help.github.com/articles/using-pull-requests) whenever you've reached a point where you're ready for a quick code review. I'll look over what you've done and offer some suggestions. It'll be a good time.
