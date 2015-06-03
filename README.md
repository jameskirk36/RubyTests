#Simple Math Parser 
Simple math expression parser written in ruby.

Given an string expression in the format "1+2((*3)/4)-5" the expression is always evaluated from left to right (does not obey BODMAS rule precedence).  It respects brackets by evaluating inner most ones first. again left to right.  The operator chars can be overridden with custom ones as specified in the spec/acceptance_test_spec.rb file

##Requirements:
Ruby 1.9.3 or greater

##Installation

Open a command window/terminal and change to the root directory of this repository.  Then run:
```
gem install bundler
bundle install
```

##Run the tests
```
bundle exec rspec
```


