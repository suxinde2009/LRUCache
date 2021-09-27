//
//  LRUCache.swift
//  FoundationExt
//
//  Created by SuXinDe on 2021/9/27.
//

import Foundation

public class LRUCache<KeyType: Hashable, ValueType> {
    
    private let maxSize: Int
    private var cache: [KeyType: ValueType] = [:]
    private var priority: [KeyType] = []
    
    public init(_ maxSize: Int = 500) {
        self.maxSize = maxSize
    }
    
    public func get(_ key: KeyType) -> ValueType? {
        guard let val = cache[key] else {
            return nil
        }
        
        remove(key)
        insert(key, val)
        
        return val
    }
    
    public func set(_ key: KeyType, _ val: ValueType) {
        if cache[key] != nil {
            remove(key)
        } else if priority.count >= maxSize, let keyToRemove = priority.last {
            remove(keyToRemove)
        }
        
        insert(key, val)
    }
    
    public subscript(_ key: KeyType) -> ValueType? {
        get {
            return get(key)
        }
        set {
            if let value = newValue {
                set(key, value)
            } else {
                remove(key)
            }
        }
    }
}

fileprivate extension LRUCache {
    
    private func remove(_ key: KeyType) {
        cache.removeValue(forKey: key)
        if let idx = priority.firstIndex(of: key) {
            priority.remove(at: idx)
        }
    }
    
    private func insert(_ key: KeyType, _ val: ValueType) {
        cache[key] = val
        priority.insert(key, at: 0)
    }
}
