#include "gamescene.h"

#include <time.h>
#include <iostream>

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
    for(int x = 0;x != 12;x++) {
        for(int y = 0;y != 8;y++) {
            int type = rand() % i;
            Block *b = new Block(x,y,type);
            m_block.push_back(b);
            std::cout << type << " ";
        }
        std::cout << std::endl;
    }

}

void GameScene::swap(int start_x, int start_y, int end_x, int end_y)
{
    int type_1 = m_block[start_x * 8 + start_y]->type();
    int type_2 = m_block[end_x * 8 + end_y]->type();
    m_block[start_x * 8 + start_y]->setType(type_2);
    m_block[end_x * 8 + end_y]->setType(type_1);
}


void GameScene::control(int begin_x, int begin_y)
{
    QList<int> block;
    for(int i = 0;i != 96;i++) {
        block.push_back(m_block[i]->type());
    }
    QList<int> b[2];
    b[0] = b[1] = block;
    for(int x =begin_x;x != 12;x++) {
        for(int y = begin_y;y != 8;y++) {
            int type = block[x * 8 + y];
            int number_x = sameOfNumber(b[0],x,y,type,0);
            int number_y = sameOfNumber(b[1],x,y,type,1);
            if(number_x >=3 && number_y >= 3) {
                clearBlocks(b[0]);
                clearBlocks(b[1]);
                std::cout << "clear all ---" << number_x << number_y<<std::endl;
            }
            else if(number_x >= 3 && number_y < 3) {
                clearBlocks(b[0]);
                std::cout << "clear x ---" << number_x << number_y <<std::endl;
            }
            else if(number_y >= 3 && number_x < 3) {
                clearBlocks(b[1]);
                std::cout << "clear y --- " << number_x<< number_y <<std::endl;
            }
            block.clear();
            for(int i = 0;i != 96;i++) {
                block.push_back(m_block[i]->type());
            }
            b[0] = b[1] = block;
        }
    }

    for(int x = 0;x != 12;x++){
        for(int y = 0;y != 8;y++){
            std::cout << m_block[x * 8 + y]->type() << "  ";
        }
        std::cout << std::endl;
    }
}

int GameScene::sameOfNumber(QList<int> &block,int x,int y,int type,int x_Or_y)
{
    if(x >= 8 || x < 0 || y >= 12 || y < 0)
        return 0;
    int b = block[x * 8 + y];
    if(b == -1)
        return 0;
    if(b != type)
        return 0;
    block[x * 8 + y] = -1;
    int count = 1;
    if(x_Or_y == 0) {
        count += sameOfNumber(block,x + 1,y,type,0);
        count += sameOfNumber(block,x - 1,y,type,0);
    }
    else if(x_Or_y == 1){
        count += sameOfNumber(block,x,y + 1,type,1);
        count += sameOfNumber(block,x,y - 1,type,1);
    }

    return count;
}

void GameScene::clearBlocks(QList<int> &block)
{
    for(int i = 0; i < 96; i++) {
        if(block[i] == -1) {
            auto blocks = m_block[i];
            if(blocks->type() != -1) {
//                std::cout << i % 8 << "  " << i / 8 << std::endl;
//                std::cout << "null" << std::endl;
                m_block[i]->setType(-1);
            }
        }
    }
}

//void GameScene::moveBlocks()
//{
//    for(int y = 0;y < 8; y++){
//        for(int x = 11; x>0;x--){
//            if(m_block[x*8+y]->setType(-1)){
//                auto moveBlock = null;
//                for(int movex = x - 1; movex >= 0; movex--) {
//                    moveBlock = m_block[movex*8+y];

//                    if(moveBlock != null) {
//                        m_block[movex*8+y] = null;
//                        m_block[x*8+y] = moveBlock;
//                        moveBlock->
//                                moveBlock.fallDown(row - moveRow);
//                    }
//                }
//            }
//        }
//    }
//}
