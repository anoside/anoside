require 'timeout'
 
# http://www.elabs.se/blog/53-why-wait_until-was-removed-from-capybara
# https://gist.github.com/jnicklas/4129937
module WaitSteps
  extend RSpec::Matchers::DSL
 
  matcher :become_true do
    match do |block|
      begin
        Timeout.timeout(Capybara.default_wait_time) do
          sleep(0.1) until value = block.call
          value
        end
      rescue TimeoutError
        false
      end
    end
  end
end
