#pragma once

#include <new>

namespace std {
[[noreturn]] inline void __throw_bad_alloc() {
  throw bad_alloc();
}
}
