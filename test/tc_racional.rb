# Implementar en este fichero las Pruebas Unitarias de nuestra gema

require "./lib/math_expansion.rb"
require "test/unit"


class Fixnum
	def self.null
       		0
	end
end
        
class String
	def self.null
       		""
	end
end
        
class Float
	def self.null
       		0.0
	end
end	
	

class Test_Matriz < Test::Unit::TestCase
	def test_simple
		@m1 = MathExpansion::Matriz_Densa.new(2,2)
	        @m2 = MathExpansion::Matriz_Densa.new(2,2)
		@m3 = MathExpansion::Matriz_Densa.new(2,2)
        
        	@m1.set(0,0,1)
        	@m1.set(0,1,2)
        	@m1.set(1,0,3)
        	@m1.set(1,1,4)
        	
        	@m2.set(0,0,5)
        	@m2.set(0,1,6)
        	@m2.set(1,0,7)
        	@m2.set(1,1,8)

		@m3.set(0,0,6)
		@m3.set(0,1,8)
		@m3.set(1,0,10)
		@m3.set(1,1,12)


		assert_equal(@m3.to_s,(@m1+@m2).to_s)
	end
	
	def test_simple2
		@md1 = MathExpansion::Matriz_Dispersa.new(2,2)
		@md2 = MathExpansion::Matriz_Dispersa.new(2,2)
		@m3 = MathExpansion::Matriz_Dispersa.new(2,2)

		@md1.set(0,0,0)
		@md1.set(0,1,0)
		@md1.set(1,0,5)
		@md1.set(1,1,0)

		@md2.set(0,0,0)
		@md2.set(0,1,0)
		@md2.set(1,0,3)
		@md2.set(1,1,0)

		@m3.set(0,0,0)
		@m3.set(0,1,0)
		@m3.set(1,0,2)
		@m3.set(1,1,0)

		assert_equal(@m3.to_s,(@md1-@md2).to_s)


	end
	
	def test_typecheck
		@m1 = MathExpansion::Matriz_Densa.new(1,1)
		@m2 = MathExpansion::Matriz_Densa.new(1,1)
		@m1.set(0,0,5)
		@m2.set(0,0,"hola")

		assert_raise(TypeError) {@m1+@m2}
	end
	
	def test_failure
		@m1 = MathExpansion::Matriz_Densa.new(1,1)
		@m2 = MathExpansion::Matriz_Densa.new(2,2)

		@m1.set(0,0,3)

		@m2.set(0,0,1)
		@m2.set(0,1,1)
		@m2.set(1,0,2)
		@m2.set(1,1,3)

		@m3 = @m1*@m2

		assert_equal(@m3,@m1*@m2)
	end
end
