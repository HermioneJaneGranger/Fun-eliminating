#ifndef GAMSCENE_H
#define GAMSCENE_H

#include <QQmlListProperty>
#include <vector>

#include "block.h"

class GameScene: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Block> blockArray READ blockArray NOTIFY blockChanged)
    Q_PROPERTY(int score READ score WRITE setScore NOTIFY scoreChanged)
    Q_PROPERTY(QList<int> passScore READ passScore NOTIFY passScoreChanged)
    Q_CLASSINFO("DefaultProperty", "block")
public:
    GameScene(QObject *parent = 0):QObject(parent){}
    GameScene(int i);

    QQmlListProperty<Block> blockArray();

    Q_INVOKABLE void refresh(int number);

    Q_INVOKABLE Block *blocks(int number) const;
    Q_INVOKABLE void swap(int start_x,int start_y,int end_x, int end_y);
    Q_INVOKABLE void control(int begin_x, int begin_y);
    int sameOfNumber(QList<int> &block, int x, int y, int type,int x_Or_y);
    void clearBlocks(QList<int> &block);
    void moveBlocks();


    void setScore(int score);

    Q_INVOKABLE int score() const;

    QList<int> passScore() const;
    void setPassScore(const QList<int> &passScore);
    void initPassScore();

signals:
    void blockChanged();
    void scoreChanged();
    void passScoreChanged();

private:
    QList<int> m_passScore;
    int m_score = 2000;
    QList<Block *> m_blocks;
    static void appendBlock(QQmlListProperty<Block> *list, Block *msg);
    static int countBlock(QQmlListProperty<Block> *list);
    static Block *atBlock(QQmlListProperty<Block> *list, int i);
    static void clearBlock(QQmlListProperty<Block> *list);

};

#endif // GAMSCENE_H
