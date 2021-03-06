# Copyright, 2015, by Samuel G. D. Williams. <http://www.codeotaku.com>
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

require 'bigdecimal'
require 'set'

module Latinum
	# Aggregates a set of resources, typically used for summing values.
	class Collection
		# Initialize the collection with a given set of resource names.
		def initialize(names = Set.new)
			@names = names
			@resources = Hash.new {|hash, key| @names << key; BigDecimal.new("0")}
		end
		
		# All resource names which have been added to the collection, e.g. `['NZD', 'USD']`.
		attr :names
		
		# A map of `name` => `total` for all added resources. Totals are stored as BigDecimal instances.
		attr :resources
		
		# Add a resource into the totals.
		def add resource
			@resources[resource.name] += resource.amount
		end
		
		# Add a resource, an array of resources, or another collection into this one.
		def << object
			case object
			when Resource
				add(object)
			when Array
				object.each { |resource| add(resource) }
			when Collection
				object.resources.each { |name, amount| @resources[name] += amount }
			end
			
			return self
		end
		
		# Get a `Resource` for the given name:
		def [] key
			Resource.new(@resources[key], key)
		end
		
		# Set a `BigDecimal` value for the given name:
		def []= key, amount
			@resources[key] = amount
		end
	end
end
