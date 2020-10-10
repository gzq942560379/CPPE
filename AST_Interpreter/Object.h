#pragma once

#include <cstdlib>
#include <cstring>
#include <cassert>

class Object
{
public:
    enum ELE_TYPE
    {
        EMPTY,
        INT32,
        UINT64,
        BOOL,
        POINTER
    };
    Object() : _data(nullptr), _type(EMPTY), _arraySize(1){};

    Object(bool val) : _type(BOOL), _arraySize(1)
    {
        alloc();
        *(bool *)_data = val;
    };

    Object(int val) : _type(INT32), _arraySize(1)
    {
        alloc();
        *(int32_t *)_data = val;
    };

    Object(uint64_t val) : _type(UINT64), _arraySize(1)
    {
        alloc();
        *(int64_t *)_data = val;
    };

    Object(void *pointer) : _arraySize(1), _type(POINTER)
    {
        alloc();
        *(void **)_data = pointer;
    };

    // array SubscriptExpr
    Object(void *pointer, ELE_TYPE type, int64_t offset) : _arraySize(1), _type(POINTER)
    {
        alloc();
        switch (type)
        {
        case EMPTY:
            break;
        case BOOL:
            *(bool **)_data = (bool *)pointer + offset;
            break;
        case INT32:
            *(int32_t **)_data = (int32_t *)pointer + offset;
            break;
        case UINT64:
            *(uint64_t **)_data = (uint64_t *)pointer + offset;
            break;
        case POINTER:
            *(void ***)_data = (void **)pointer + offset;
            break;
        default:
            assert(0);
            break;
        }
    };

    Object(bool isArray, size_t arraySize, ELE_TYPE type) : _arraySize(arraySize), _type(type)
    {
        alloc();
    }
    ~Object()
    {
        if (_needFree)
            free(_data);
    };
    bool isNull() const
    {
        return _type == EMPTY || _data == nullptr;
    };
    bool isInt32() const
    {
        return _type == INT32;
    }
    bool isUInt64() const
    {
        return _type == UINT64;
    }
    int32_t getInt32() const
    {
        assert(_type == INT32);
        return *(int32_t *)_data;
    };
    uint64_t getUInt64() const
    {
        assert(_type == UINT64);
        return *(uint64_t *)_data;
    };
    bool getBool() const
    {
        assert(_type == BOOL);
        return *(bool *)_data;
    };
    bool isArray() const
    {
        return _arraySize > 1;
    }
    void *getPointer() const
    {
        assert(_type == POINTER);
        return *(void **)_data;
    }
    void *getAddress() const
    {
        return _data;
    }

private:
    void alloc()
    {
        assert(_arraySize > 0);
        assert(sizeOf(_type) > 0);
        _data = malloc(sizeOf(_type) * _arraySize);
        _needFree = true;
    };

    static size_t sizeOf(ELE_TYPE type)
    {
        switch (type)
        {
        case ELE_TYPE::EMPTY:
            return 0;
        case ELE_TYPE::BOOL:
            return sizeof(bool);
        case ELE_TYPE::INT32:
            return sizeof(int64_t);
        case ELE_TYPE::UINT64:
            return sizeof(uint64_t);
        case ELE_TYPE::POINTER:
            return sizeof(void *);
        default:
            assert(0);
        }
    };

    void *_data;
    const ELE_TYPE _type;
    const size_t _arraySize;
    bool _needFree = false;
};
