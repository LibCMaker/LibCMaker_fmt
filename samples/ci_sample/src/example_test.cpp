/*****************************************************************************
 * Project:  LibCMaker_fmt
 * Purpose:  A CMake build script for fmt library
 * Author:   NikitaFeodonit, nfeodonit@yandex.com
 *****************************************************************************
 *   Copyright (c) 2017-2019 NikitaFeodonit
 *
 *    This file is part of the LibCMaker_fmt project.
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published
 *    by the Free Software Foundation, either version 3 of the License,
 *    or (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *    See the GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program. If not, see <http://www.gnu.org/licenses/>.
 ****************************************************************************/

// The code is based on the code from
// https://fmt.dev/latest/api.html

#include <type_traits>
#include <fmt/format.h>

#include "gtest/gtest.h"

struct A {
  virtual ~A() {}
  virtual std::string name() const { return "A"; }
};

struct B : A {
  virtual std::string name() const { return "B"; }
};

template <typename T>
struct fmt::formatter<T, std::enable_if_t<std::is_base_of<A, T>::value, char>> :
    fmt::formatter<std::string> {
  template <typename FormatCtx>
  auto format(const A& a, FormatCtx& ctx) {
    return fmt::formatter<std::string>::format(a.name(), ctx);
  }
};

TEST(Examle, test) {
  B b;
  A& a = b;
  std::string s = fmt::format("{}", a);
  EXPECT_TRUE(s == "B");
}
