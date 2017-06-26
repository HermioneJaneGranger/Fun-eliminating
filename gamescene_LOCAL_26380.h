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
    GameScene(int i);

    QQmlListProperty<Block> block();
    static void appendBlock(QQmlListProperty<Block> *list, Block *msg);

//    void setBlock(const QList<Block *> &block);

    Q_INVOKABLE Block *blocks(int number) const;
    Q_INVOKABLE void swap(int start_x,int start_y,int end_x, int end_y);
    Q_INVOKABLE void control(int begin_x, int begin_y);
    int sameOfNumber(QList<int> &block, int x, int y, int type,int x_Or_y);
    void clearBlocks(QList<int> &block);
    void moveBlocks();

    QList<Block *> m_block;

signals:
    void blockChanged();

};

#endif // GAMSCENE_H
