// Copyright Hugh Perkins 2015 hughperkins at gmail
//
// This Source Code Form is subject to the terms of the Mozilla Public License,
// v. 2.0. If a copy of the MPL was not distributed with this file, You can
// obtain one at http://mozilla.org/MPL/2.0/.



// adds source to target
// tiles source as necessary, according to tilingSize
__kernel void per_element_tiled_add(const int N, const int tilingSize, global float *target, global const float *source) {
    const int globalId = get_global_id(0);
    if (globalId >= N) {
        return;
    }
    target[globalId] += source[globalId % tilingSize];
}
