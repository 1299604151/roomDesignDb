import request from '@/utils/request'

// 查询工单时间线列表
export function listTimeline(query) {
  return request({
    url: '/system/timeline/list',
    method: 'get',
    params: query
  })
}

// 查询工单时间线详细
export function getTimeline(id) {
  return request({
    url: '/system/timeline/' + id,
    method: 'get'
  })
}

// 新增工单时间线
export function addTimeline(data) {
  return request({
    url: '/system/timeline',
    method: 'post',
    data: data
  })
}

// 修改工单时间线
export function updateTimeline(data) {
  return request({
    url: '/system/timeline',
    method: 'put',
    data: data
  })
}

// 删除工单时间线
export function delTimeline(id) {
  return request({
    url: '/system/timeline/' + id,
    method: 'delete'
  })
}
