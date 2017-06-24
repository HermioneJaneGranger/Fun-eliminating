#include "gamescene.h"

#include <time.h>

QQmlListProperty<Block> GameScene::block()
{
    return QQmlListProperty<Block>(this,nullptr,&GameScene::appendBlock,0,0,0);
}

void GameScene::appendBlock(QQmlListProperty<Block> *list, Block *msg)
{
    GameScene *game = qobject_cast<GameScene *>(list->object);
    if(msg) {
        msg->setParent(game);
        game->m_block.append(msg);
    }
}

void GameScene::setBlock(const QList<Block *> &block)
{
    m_block = block;
}

QList<Block *> GameScene::blocks() const
{
    return m_block;
}

GameScene::GameScene(int i)/*:QObject(parent)*/
{
    srand((unsigned)time(NULL));
    for(int x = 0;x != 8;x++) {
        for(int y = 0;y != 12;y++) {
            int type = rand() % i;
            Block b(x,y,type);
            m_block.push_back(&b);
        }
    }
}
