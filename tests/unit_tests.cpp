#include "math_operations.h"
#include <gtest/gtest.h>

TEST(MathOperationsTest, AddFunction)
{
    EXPECT_EQ(add(2, 3), 5);
    EXPECT_EQ(add(-1, 1), 0);
    EXPECT_EQ(add(0, 0), 0);
    EXPECT_EQ(add(-5, -5), -10);
    EXPECT_EQ(add(100, 200), 300);
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}