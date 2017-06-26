#include "block.h"
#include <iostream>

#include <time.h>

int Block::row() const
{
    return m_row;
}

void Block::setRow(int row)
{
    m_row = row;
}

int Block::column() const
{
    return m_column;
}

void Block::setColumn(int column)
{
    m_column = column;
}

int Block::type() const
{
    return m_type;
}

void Block::setType(int type)
{
    m_type = type;
}
