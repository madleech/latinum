# encoding: utf-8
#
# Copyright (c) 2012 Samuel G. D. Williams. <http://www.oriontransfer.co.nz>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'latinum/formatters'

module Latinum
	module Currencies
		Global = {}
		
		Global[:NZD] = {
			:symbol => '$',
			:name => 'NZD',
			:description => 'New Zealand Dollar',
			:formatter => Formatters::DecimalCurrencyFormatter,
		}
		
		Global[:GBP] = {
			:symbol => '£',
			:name => 'GBP',
			:description => 'Pound Sterling',
			:formatter => Formatters::DecimalCurrencyFormatter,
		}
		
		Global[:AUD] = {
			:symbol => '$',
			:name => 'AUD',
			:description => 'Australian Dollar',
			:formatter => Formatters::DecimalCurrencyFormatter,
		}
		
		Global[:USD] = {
			:symbol => '$',
			:name => 'USD',
			:description => 'United States Dollar',
			:formatter => Formatters::DecimalCurrencyFormatter,
		}
		
		Global[:EUR] = {
			:symbol => '€',
			:name => 'EUR',
			:description => 'Euro',
			:formatter => Formatters::DecimalCurrencyFormatter,
			#:delimeter => '.',
			#:separator => ','
		}
	end
end
