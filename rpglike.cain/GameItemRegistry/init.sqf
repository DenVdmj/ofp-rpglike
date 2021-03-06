#define __registryDirectory "GameItemRegistry\registry.sqf"
#define __registry varGlobalGameItemRegistry
#define arg(i) (_this select (i))

__registry = [];

private [
    "_registryData",
    "_countRegistryData",
    "_categoryName",
    "_categoryData",
    "_index",
    "_writeCategory",
    "_chunk"
];

_registryData = call ("["+(preprocessFile __registryDirectory)+"]");
_countRegistryData = count _registryData;

_categoryName = "UNDEFINED";
_categoryData = [];

_index = 0;

_writeCategory = {
    if (count _categoryData > 0) then {
        [__registry, _categoryName, _categoryData] call funcStorageAdd;
        _categoryData = [];
    };
};

while {_index < _countRegistryData} do {
    _chunk = _registryData select _index;
    if (_chunk in [_chunk]) then {
        call _writeCategory;
        _categoryName = _chunk;
    } else {
        [_categoryData, _chunk select 0,
            // ����� ����������� ����� �������� ���������
            [
                "price", _chunk select 1,
                "ico", _chunk select 2
                // ��������:
                // "description", _chunk select 2,
                // "��� ���� �����-���� ��������", _chunk select 3
            ] call funcStorageCreate
        ] call funcStorageAdd;
        [__registry, _object, _record] call funcStorageAdd;
    };
    _index = _index + 1;
};

call _writeCategory;

//
// funcGetGameItemData
// Syntax:
//      [categoryPrefix, itemName<, fieldName>] call funcGetGameItemData
// Example 1:
//      ["M", "Browning", "price"] call funcGetGameItemData
// Example 2:
//      _browningData = ["M", "Browning"] call funcGetGameItemData
//      _someValue = [_browningData, "someKey"] call funcStorageGet
//

funcGetGameItemData = {
    private "_rec";
    _rec = [[__registry, arg(0), nil] call funcStorageGet, arg(1), nil] call funcStorageGet;
    if (count _this > 2) then {
        [_rec, arg(2), arg(3)] call funcStorageGet
    } else {
        _rec
    }
};

// ["M", "rls_Map", "ico", "123"] call funcGetGameItemData
// _rec = ["M", "rls_Map"] call funcGetGameItemData; [_rec, "ico"] call funcStorageGet
//

//
// funcSetGameItemData
// Syntax:
//      [categoryPrefix, itemName, fieldName, value] call funcSetGameItemData
// Example:
//      ["M", "Browning", "price", 1000] call funcSetGameItemData
//

funcSetGameItemData = {
    private "_rec";
    _rec = [[__registry, arg(0), nil] call funcStorageGet, arg(1), nil] call funcStorageGet;
    if (count _this > 2) then {
        [_rec, arg(2), arg(3)] call funcStorageSet
    };
};

//
// funcGetGameItemPrice
// Syntax:
//      ["category", "itemName"] call funcGetGameItemPrice
//      ["category", "itemName", defaultPrice] call funcGetGameItemPrice
//
// Example:
//      ["M", "HKG3Mag"] call funcGetGameItemPrice
//      ["W", "HKG3"] call funcGetGameItemPrice
//
// Returns price of item
//

funcGetGameItemPrice = {
    [arg(0), arg(1), "price", arg(2)] call funcGetGameItemData
};

//
// funcSetGameItemPrice
// Syntax:
//      ["category", "itemName", newPrice] call funcSetGameItemPrice
//
// Example:
//      ["M", "HKG3Mag", 80] call funcSetGameItemPrice
//

funcSetGameItemPrice = {
    [arg(0), arg(1), "price", arg(2)] call funcSetGameItemData
};

//
// funcGetGameItemIco
// Syntax:
//      ["category", "itemName"] call funcGetGameItemIco
//      ["category", "itemName", defaultIco] call funcGetGameItemIco
//
// Example:
//      ["M", "HKG3Mag"] call funcGetGameItemIco
//

funcGetGameItemIco = {
    [arg(0), arg(1), "ico", arg(2)] call funcGetGameItemData
};





