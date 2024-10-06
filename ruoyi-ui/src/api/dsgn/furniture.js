import request from '@/utils/request'

// 查询家具素材-设计方案关联列表
export function listFurniture(query) {
  return request({
    url: '/system/furniture/list',
    method: 'get',
    params: query
  })
}

// 查询家具素材-设计方案关联详细
export function getFurniture(id) {
  return request({
    url: '/system/furniture/' + id,
    method: 'get'
  })
}

// 新增家具素材-设计方案关联
export function addFurniture(data) {
  return request({
    url: '/system/furniture',
    method: 'post',
    data: data
  })
}

// 修改家具素材-设计方案关联
export function updateFurniture(data) {
  return request({
    url: '/system/furniture',
    method: 'put',
    data: data
  })
}

// 删除家具素材-设计方案关联
export function delFurniture(id) {
  return request({
    url: '/system/furniture/' + id,
    method: 'delete'
  })
}
