#ifndef BLOCK_H
#define BLOCK_H

#include <QObject>
#include <time.h>

class Block: public QObject
{
    Q_OBJECT
    Q_PROPERTY(int row READ row WRITE setRow NOTIFY rowChanged)
    Q_PROPERTY(int column READ column WRITE setColumn NOTIFY columnChanged)
    Q_PROPERTY(int type READ type  WRITE setType NOTIFY typeChanged)
public:
    explicit Block(QObject *parent = 0):QObject(parent){}
    explicit Block(int row,int column,int type):m_row(row),m_column(column),m_type(type)
    {}
    int row() const;
    void setRow(int row);

    int column() const;
    void setColumn(int column);

    int type() const;

    void setType(int type);
signals:
    void rowChanged();
    void columnChanged();
    void typeChanged();

private:
    int m_row;
    int m_column;
    int m_type;
};

#endif // BLOCK_H
