// Copyright 2022 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Enable a void internal extension for multiple times
enable InternalExtensionForTesting;
enable InternalExtensionForTesting;
enable InternalExtensionForTesting;

fn bar() {
}

@stage(fragment)
fn main() -> @location(0) vec4<f32> {
    var a : vec2<f32> = vec2<f32>();
    bar();
    return vec4<f32>(0.4, 0.4, 0.8, 1.0);
}
