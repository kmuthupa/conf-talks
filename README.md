conf_talks
==========

This gem is the solution to the conference talks problem uses the following tools:

1. Ruby 1.9.3
2. Bundler for dependency management
3. Minitest for unit testing

Assumptions that drove this solution:

1. The talk durations can be lightning(5 mins), 30 mins, 45 mins and 60 mins. It is not designed to handle talks with random durations but can be scaled to add talks with different durations
2. The max duration of the pre-lunch session and the post-lunch session is 3 hours and 4 hours respectively
3. Longer talks occur before shorter ones in a track
4. The conference consists of two tracks only
5. The list of talks is fed via the talks.yml sitting in the root

To run and test the solution:

1. gem install 'conf-talks'
2. run-conf-talks

