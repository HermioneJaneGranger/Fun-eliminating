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

//void GameScene::setBlock(const QList<Block *> &block)
//{
//    m_block = block;
//}

Block *GameScene::blocks(int number) const
{
    return m_block[number];
}

GameScene::GameScene(int i)
{
    srand((unsigned)time(NULL));
    for(int y = 0;y != 12;y++) {
        for(int x = 0;x != 8;x++) {
            int type = rand() % i;
            Block *b = new Block(x,y,type);
            m_block.push_back(b);
        }
    }
}
