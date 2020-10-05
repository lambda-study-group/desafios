using System;
using Xunit;

namespace reverse.tests
{
    public class UnitTest1
    {
        [Fact]
        [Trait("assert number", "1234")]
        public void Test1()
        {
            Assert.Equal("4321", Program.Revert("1234"));
        }
        [Fact]
        [Trait("assert number", "12")]
        public void Test2()
        {
            Assert.Equal("21", Program.Revert("12"));
        }
        [Fact]
        [Trait("assert number", "0")]
        public void Test3()
        {
            Assert.Equal("0", Program.Revert("0"));
        }
        [Fact]
        [Trait("assert number", "6641112222223333333345678901118")]
        public void Test4()
        {
            Assert.Equal("8111098765433333333222222111466", Program.Revert("6641112222223333333345678901118"));
        }
        [Fact]
        [Trait("assert text", "erro")]
        public void Test5()
        {
            Assert.Equal("Erro", Program.Revert("lalala"));
        } 
    }
}
