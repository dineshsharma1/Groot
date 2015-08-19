// GRTSerializationStrategy.m
//
// Copyright (c) 2014-2015 Guillermo Gonzalez
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

#import "GRTInsertSerializationStrategy.h"
#import "GRTUniquingSerializationStrategy.h"
#import "GRTCompoundUniquingSerializationStrategy.h"

#import "NSEntityDescription+Groot.h"

id<GRTSerializationStrategy> GRTSerializationStrategyForEntity(NSEntityDescription *entity) {
    NSSet *attributes = [entity grt_identityAttributes];
    
    if (attributes.count == 0) {
        return [[GRTInsertSerializationStrategy alloc] initWithEntity:entity];
    } else if (attributes.count == 1) {
        return [[GRTUniquingSerializationStrategy alloc] initWithEntity:entity uniqueAttribute:attributes.anyObject];
    } else {
        return [[GRTCompoundUniquingSerializationStrategy alloc] initWithEntity:entity uniqueAttributes:attributes];
    }
}
