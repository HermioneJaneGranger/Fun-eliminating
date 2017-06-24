#ifndef GAMSCENE_H
#define GAMSCENE_H

#include <QQmlListProperty>
#include <vector>

#include "block.h"

class GameScene: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Block> block READ block NOTIFY blockChanged)
    Q_CLASSINFO("DefaultProperty", "block")
public:
    GameScene(QObject *parent = 0):QObject(parent){}
    GameScene(/*QObject *parent = 0*/int i);

    QQmlListProperty<Block> block();
    static void appendBlock(QQmlListProperty<Block> *list, Block *msg);

    void setBlock(const QList<Block *> &block);

    Q_INVOKABLE Block *blocks(int number) const;

    QList<Block *> m_block;
signals:
    void blockChanged();


//private:
//    QList<Block *> m_block;
};

#endif // GAMSCENE_H
