struct strided_arr {
  @size(16)
  el : vec2<f32>,
}

struct SSBO {
  m : array<strided_arr, 2u>,
}

@group(0) @binding(0) var<storage, read_write> ssbo : SSBO;

fn arr_to_mat2x2_stride_16(arr : array<strided_arr, 2u>) -> mat2x2<f32> {
  return mat2x2<f32>(arr[0u].el, arr[1u].el);
}

fn mat2x2_stride_16_to_arr(m : mat2x2<f32>) -> array<strided_arr, 2u> {
  return array<strided_arr, 2u>(strided_arr(m[0u]), strided_arr(m[1u]));
}

fn f_1() {
  let x_15 : mat2x2<f32> = arr_to_mat2x2_stride_16(ssbo.m);
  ssbo.m = mat2x2_stride_16_to_arr(x_15);
  return;
}

@stage(compute) @workgroup_size(1i, 1i, 1i)
fn f() {
  f_1();
}
