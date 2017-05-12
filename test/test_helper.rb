
old_verbose = $VERBOSE
$VERBOSE = nil
require 'minitest/spec'
require "minitest/autorun"
require 'minitest/pride'
$VERBOSE = old_verbose
require_relative '../lib/gilded_rose'


