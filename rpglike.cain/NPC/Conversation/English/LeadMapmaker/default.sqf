// SQF: NPC Conversation
#include "rls\macro"

[
    "������ ���",
    {
        setAve("����. �������");

        [
            "������, � ��� ��������� %2, � � ���� ������ ��� ���.\n����� ������� :)",
            "��� ������� ���, � � �� �����, � ������ � ��� ���� ������. �������, ������ ������.",
            "� �����, � ������ ������� ������� ���-�������� ������ ��� ������� ����, �� �� ����� ��� ��� �������",
            "�����������, ����� ������, ����� ������.",
            [
                ["��, ���������!", "������"],
                ["�������, �� � ��� �����, � ����� �������", "[exit]"],
                ["� � �� �����, �����-�����!", "��� �����", isFlag("����� �������")],
                ["���������?", "[trade]"]
            ]
        ]
    },
    "������",
    {
        setAve("����. ��� ����������");
        [
            "����������� ���",
            "����������� ���",
            "����������� ���",
            "����������� ������",
            [
                ["��� ��� ��!", "����-����"],
                ["�������� ��� ���", "������"]
            ]
        ]
    },
    "����. �������",
    {
        [
            "������, ���������?",
            [
                ["������, ��-��, ���������!", "������"],
                ["� ��� ��� �����, ������", "[exit]"]
            ]
        ]
    },
    "����. ��� ����������",
    {
        [
            "������! ���, ��� � �����, � ���� ��� ����������.\n�� ���� ���������� � �� ������� ����, ������? ��� �������� ���� ���-���? ����� ���-�����? :)",
            [
                ["��, ����������, � ���� ��������� ���.", "������"],
                ["��������� ������ �����!", "�����"],
                ["��� �������!", "[exit]"]
            ]
        ]
    },
    "����-����",
    {
        [
            "�����������? �� ��� ���������� � ��� :) ���������� ������",
            [
                ["�����������!", "[exit]"]
            ]
        ]
    },
    "�����",
    {
        setAve("������ ���");
        addFlag("����� �������");
        [
            "�� �� �����! ����� ��� � ����, ������ �����������. �� ��� �� �������, ����� �� ������ �����. ������ ��� ��� ������������ �������� ����� ��������. ��?",
            "� ����� � ���� �������� ���� ����... ���, ��� �� ��� ���������...",
            "���� ��������� ��������, �� �� ���� ��������� �����. ����� ����������, ��� ��� ������� �� ����� ��������, �������, ��� ��� � ����. �� ���� ����� � ����������, � ������ �� ���.",
            "������: �� ����� ������ ��������, ��� � ������ � ���, ��� �� �������, ��� ������ �� ������ ������, ��� � ���� ������.",
            "��� �� ���. ��� ������ ������ ����� setAve. ������ ����� �� ������� ���� �����, ��� ���������� ����� setAve(""������ ���""). ������ ������ ""����"", � ������ ����������� �������� �� ���... ���... ��������� ��������.",
            [
                ["����!", "[exit]"]
            ]
        ]
    },
    "��� �����",
    {
        [
            "� �� ���� ������? ����� �� ������ ����� �� �������. � �����, ��� ����� ������ ��� �������",
            [
                ["����� (�����)", "[exit]"]
            ]
        ]
    }
]
