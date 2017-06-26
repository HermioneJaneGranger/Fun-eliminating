#include "gamescene.h"
#include <time.h>
#include <iostream>

QQmlListProperty<Block> GameScene::blockArray()
{
    return QQmlListProperty<Block>(this,nullptr,GameScene::appendBlock,GameScene::countBlock,GameScene::atBlock,GameScene::clearBlock);
}

void GameScene::appendBlock(QQmlListProperty<Block> *list, Block *msg)
{
    GameScene *game = qobject_cast<GameScene *>(list->object);
    if(msg) {
        msg->setParent(game);
        game->m_blocks.append(msg);
    }
    emit game->blockChanged();
}

int GameScene::countBlock(QQmlListProperty<Block> *list)
{
    GameScene *g = qobject_cast<GameScene *>(list->object);
    if(g)
        return g->m_blocks.count();
    return 0;
}

Block *GameScene::atBlock(QQmlListProperty<Block> *list, int i)
{
    GameScene *g = qobject_cast<GameScene *>(list->object);
    if(g)
        return g->m_blocks.at(i);
    return nullptr;
}

void GameScene::clearBlock(QQmlListProperty<Block>  *list)
{
    GameScene *g = qobject_cast<GameScene *>(list->object);
    if(g)
    {
        g->m_blocks.clear();
        emit g->blockChanged();
    }
}

void GameScene::refresh(int number)
{
    srand((unsigned)time(NULL));
    for(int i = 0;i != 12;i++) {
        for(int y = 0;y != 8;y++) {
            int type = rand() % number;
            m_blocks[i * 8 + y]->setType(type);
        }
    }
}


Block *GameScene::blocks(int number) const
{
    return m_blocks[number];
}


GameScene::GameScene(int i)
{
    srand((unsigned)time(NULL));
    for(int y = 0;y != 12;y++) {
        for(int x = 0;x != 8;x++) {
            int type = rand() % i;
            Block *b = new Block(x,y,type);
            m_blocks.push_back(b);
        }
    }
}
