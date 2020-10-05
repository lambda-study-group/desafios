using System;
using Xunit;
using Primality;
namespace Primality.Test
{
    public class UnitTest1
    {
        [Fact]
        [Trait("test primality of 0","false")]
        public void TestWith0()
        {
            Assert.False(Program.IsPrime(0));
        }
        [Fact]
        [Trait("test primality of 1","false")]
        public void TestWith1()
        {
            Assert.False(Program.IsPrime(1));
        }
        [Fact]
        [Trait("test primality of 2","true")]
        public void TestWith2()
        {
            Assert.True(Program.IsPrime(2));
        }
        [Fact]
        [Trait("test primality of 3", "true")]
        public void TestWith3()
        {
            Assert.True(Program.IsPrime(3));
        }
        [Fact]
        [Trait("test primality of 79", "true")]
        public void TestWith79()
        {
            Assert.True(Program.IsPrime(79));
        }
        [Fact]
        [Trait("test primality of 104742", "false")]
        public void TestWith104742()
        {
            Assert.False(Program.IsPrime(104742));
        }
        [Fact]
        [Trait("test primality of 104743", "true")]
        public void TestWith104743()
        {
            Assert.True(Program.IsPrime(104743));
        }
    }
}
